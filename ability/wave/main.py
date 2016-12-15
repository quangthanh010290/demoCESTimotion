import netifaces
import socket
import struct
import threading
import json
import zmq
import time
from DeskControl import DeskControl


class Wave(object):
    START = "start"
    STOP = "stop"
    state = STOP
    arr_anim_1 = None
    arr_anim_2 = None
    arr_anim_3 = None
    server_ip = None

    zmq_connected = False
    context = zmq.Context()
    socket = context.socket(zmq.SUB)

    def __init__(self):
        super(Wave, self).__init__()
        ping_timer = PingTimerClass(self.on_receive_server_ip)
        ping_timer.setDaemon(True)
        ping_timer.start()

    def load_actions(self):
        for i in range(1, 4):
            try:
                with open(str(i) + ".json") as data_file:
                    if i == 1:
                        self.arr_anim_1 = json.load(data_file)
                    elif i == 2:
                        self.arr_anim_2 = json.load(data_file)
                    elif i == 3:
                        self.arr_anim_3 = json.load(data_file)

            except Exception as ex:
                print str(ex)

    def is_need_connect_socket(self):
        if self.server_ip is not None and not self.zmq_connected:
            return True
        return False

    def start_receive_data(self):
        tmr = None
        while True:
            if self.is_need_connect_socket():
                self.zmq_connected = True
                self.socket.connect("tcp://" + self.server_ip + ":6002")
                topicfilter = "SMART_DESK"
                self.socket.setsockopt(zmq.SUBSCRIBE, topicfilter)

                print 'create zmq socket successfully'
                while True:
                    string = self.socket.recv()
                    if self.START in string:
                        if self.state != self.START:
                            self.state = self.START

                            if '1' in string:
                                print 'start anim 1'
                                tmr = ZMQTimerClass(self.arr_anim_1)

                            elif '2' in string:
                                print 'start anim 2'
                                tmr = ZMQTimerClass(self.arr_anim_2)

                            elif '3' in string:
                                print 'start anim 3'
                                tmr = ZMQTimerClass(self.arr_anim_3)

                            tmr.start()

                    elif self.STOP in string:
                        if self.state != self.STOP:
                            self.state = self.STOP
                            print 'stop'
                            tmr.stop()

            time.sleep(0.5)

    def on_receive_server_ip(self, ip):
        print 'received server ip = ' + ip
        self.zmq_connected = False
        self.server_ip = ip


class PingTimerClass(threading.Thread):
    def __init__(self, call_back):
        threading.Thread.__init__(self)
        self.call_back = call_back

    def run(self):
        MCAST_GRP = '224.1.1.1'
        MCAST_PORT = 5007
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind(('', MCAST_PORT))
        mreq = struct.pack("4sl", socket.inet_aton(MCAST_GRP), socket.INADDR_ANY)

        sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
        while True:
            tmp = sock.recv(10240)
            self.call_back(tmp)


class ZMQTimerClass(threading.Thread):
    interrupt = False
    arr = None
    desk_control = DeskControl()

    def __init__(self, arr_actions):
        threading.Thread.__init__(self)
        self.event = threading.Event()
        self.arr = arr_actions
        self.count = len(arr_actions)

    def run(self):
        while self.count > 0 and not self.event.is_set():
            data = self.arr[len(self.arr) - self.count]
            self.event.wait(data["time"])
            if not self.interrupt:
                self.desk_control.set_height(data["value"])
                self.count -= 1
                if self.count == 0:
                    self.count = len(self.arr)

    def stop(self):
        self.event.set()
        self.interrupt = True
        self.desk_control.down()


def get_default_gateway():
    gws = netifaces.AF_INET
    data = gws["default"][netifaces.AF_INET]
    return data[0]


def get_ip_address():
    try:
        #ip = netifaces.ifaddresses("wlan0")[netifaces.AF_INET][0]['addr']
        ip = netifaces.ifaddresses("eth0")[netifaces.AF_INET][0]['addr']
        if ip is not None:
            return ip

    except Exception as ex:
        print "Cannot get address of wlan0 --> " + str(ex)
    return None

if __name__ == '__main__':
    while True:
        time.sleep(1)
        if get_ip_address() is not None:
            break
    wave = Wave()
    wave.load_actions()
    wave.start_receive_data()

