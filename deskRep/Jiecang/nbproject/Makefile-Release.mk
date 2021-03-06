#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/user/main.o \
	${OBJECTDIR}/user/src/DeskComm.o \
	${OBJECTDIR}/user/src/DeskManager.o \
	${OBJECTDIR}/user/src/MySerial.o \
	${OBJECTDIR}/user/src/MyZMQ.o \
	${OBJECTDIR}/user/src/Thread.o

# Test Directory
TESTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}/tests

# Test Files
TESTFILES= \
	${TESTDIR}/TestFiles/f1 \
	${TESTDIR}/TestFiles/f2

# Test Object Files
TESTOBJECTFILES= \
	${TESTDIR}/tests/MySerial_testclass.o \
	${TESTDIR}/tests/MySerial_testrunner.o \
	${TESTDIR}/tests/MyZmq_testclass.o \
	${TESTDIR}/tests/MyZmq_testrunner.o

# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=`pkg-config --libs libzmq` -lpthread   

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/jiecang

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/jiecang: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/jiecang ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/user/main.o: user/main.cpp
	${MKDIR} -p ${OBJECTDIR}/user
	${RM} "$@.d"
	$(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/main.o user/main.cpp

${OBJECTDIR}/user/src/DeskComm.o: user/src/DeskComm.cpp
	${MKDIR} -p ${OBJECTDIR}/user/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/src/DeskComm.o user/src/DeskComm.cpp

${OBJECTDIR}/user/src/DeskManager.o: user/src/DeskManager.cpp
	${MKDIR} -p ${OBJECTDIR}/user/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/src/DeskManager.o user/src/DeskManager.cpp

${OBJECTDIR}/user/src/MySerial.o: user/src/MySerial.cpp
	${MKDIR} -p ${OBJECTDIR}/user/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/src/MySerial.o user/src/MySerial.cpp

${OBJECTDIR}/user/src/MyZMQ.o: user/src/MyZMQ.cpp
	${MKDIR} -p ${OBJECTDIR}/user/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/src/MyZMQ.o user/src/MyZMQ.cpp

${OBJECTDIR}/user/src/Thread.o: user/src/Thread.cpp
	${MKDIR} -p ${OBJECTDIR}/user/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/src/Thread.o user/src/Thread.cpp

# Subprojects
.build-subprojects:

# Build Test Targets
.build-tests-conf: .build-tests-subprojects .build-conf ${TESTFILES}
.build-tests-subprojects:

${TESTDIR}/TestFiles/f1: ${TESTDIR}/tests/MySerial_testclass.o ${TESTDIR}/tests/MySerial_testrunner.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc} -o ${TESTDIR}/TestFiles/f1 $^ ${LDLIBSOPTIONS}   `cppunit-config --libs`   

${TESTDIR}/TestFiles/f2: ${TESTDIR}/tests/MyZmq_testclass.o ${TESTDIR}/tests/MyZmq_testrunner.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc} -o ${TESTDIR}/TestFiles/f2 $^ ${LDLIBSOPTIONS}   `cppunit-config --libs`   


${TESTDIR}/tests/MySerial_testclass.o: tests/MySerial_testclass.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -O2 `pkg-config --cflags libzmq`  `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/MySerial_testclass.o tests/MySerial_testclass.cpp


${TESTDIR}/tests/MySerial_testrunner.o: tests/MySerial_testrunner.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -O2 `pkg-config --cflags libzmq`  `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/MySerial_testrunner.o tests/MySerial_testrunner.cpp


${TESTDIR}/tests/MyZmq_testclass.o: tests/MyZmq_testclass.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -O2 `pkg-config --cflags libzmq`  `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/MyZmq_testclass.o tests/MyZmq_testclass.cpp


${TESTDIR}/tests/MyZmq_testrunner.o: tests/MyZmq_testrunner.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -O2 `pkg-config --cflags libzmq`  `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/MyZmq_testrunner.o tests/MyZmq_testrunner.cpp


${OBJECTDIR}/user/main_nomain.o: ${OBJECTDIR}/user/main.o user/main.cpp 
	${MKDIR} -p ${OBJECTDIR}/user
	@NMOUTPUT=`${NM} ${OBJECTDIR}/user/main.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/main_nomain.o user/main.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/user/main.o ${OBJECTDIR}/user/main_nomain.o;\
	fi

${OBJECTDIR}/user/src/DeskComm_nomain.o: ${OBJECTDIR}/user/src/DeskComm.o user/src/DeskComm.cpp 
	${MKDIR} -p ${OBJECTDIR}/user/src
	@NMOUTPUT=`${NM} ${OBJECTDIR}/user/src/DeskComm.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/src/DeskComm_nomain.o user/src/DeskComm.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/user/src/DeskComm.o ${OBJECTDIR}/user/src/DeskComm_nomain.o;\
	fi

${OBJECTDIR}/user/src/DeskManager_nomain.o: ${OBJECTDIR}/user/src/DeskManager.o user/src/DeskManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/user/src
	@NMOUTPUT=`${NM} ${OBJECTDIR}/user/src/DeskManager.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/src/DeskManager_nomain.o user/src/DeskManager.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/user/src/DeskManager.o ${OBJECTDIR}/user/src/DeskManager_nomain.o;\
	fi

${OBJECTDIR}/user/src/MySerial_nomain.o: ${OBJECTDIR}/user/src/MySerial.o user/src/MySerial.cpp 
	${MKDIR} -p ${OBJECTDIR}/user/src
	@NMOUTPUT=`${NM} ${OBJECTDIR}/user/src/MySerial.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/src/MySerial_nomain.o user/src/MySerial.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/user/src/MySerial.o ${OBJECTDIR}/user/src/MySerial_nomain.o;\
	fi

${OBJECTDIR}/user/src/MyZMQ_nomain.o: ${OBJECTDIR}/user/src/MyZMQ.o user/src/MyZMQ.cpp 
	${MKDIR} -p ${OBJECTDIR}/user/src
	@NMOUTPUT=`${NM} ${OBJECTDIR}/user/src/MyZMQ.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/src/MyZMQ_nomain.o user/src/MyZMQ.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/user/src/MyZMQ.o ${OBJECTDIR}/user/src/MyZMQ_nomain.o;\
	fi

${OBJECTDIR}/user/src/Thread_nomain.o: ${OBJECTDIR}/user/src/Thread.o user/src/Thread.cpp 
	${MKDIR} -p ${OBJECTDIR}/user/src
	@NMOUTPUT=`${NM} ${OBJECTDIR}/user/src/Thread.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 `pkg-config --cflags libzmq`   -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/user/src/Thread_nomain.o user/src/Thread.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/user/src/Thread.o ${OBJECTDIR}/user/src/Thread_nomain.o;\
	fi

# Run Test Targets
.test-conf:
	@if [ "${TEST}" = "" ]; \
	then  \
	    ${TESTDIR}/TestFiles/f1 || true; \
	    ${TESTDIR}/TestFiles/f2 || true; \
	else  \
	    ./${TEST} || true; \
	fi

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
