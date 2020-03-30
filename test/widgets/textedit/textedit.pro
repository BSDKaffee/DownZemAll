#isEmpty(TEMPLATE):TEMPLATE=app
TARGET       = tst_textedit
CONFIG      += testcase
QT           = core testlib
QT          += widgets
SOURCES     += tst_textedit.cpp

CONFIG      += c++11

# Include:
INCLUDEPATH += ../../../include/

# Resources:
HEADERS += \
    $$PWD/../../../src/widgets/textedit.h

SOURCES += \
    $$PWD/../../../src/widgets/textedit.cpp



#-------------------------------------------------
# TARGET DIRECTORY
#-------------------------------------------------
# Needs to define a subfolder, as the *.DLL
# cannot be copied in the root folder.
DESTDIR = $${OUT_PWD}


#-------------------------------------------------
# INSTALL
#-------------------------------------------------
# install Qt binaries (for Windows only)
# This is a hack for 'windeployqt'
win32{
    CONFIG(debug,debug|release){
        libs_qt_to_copy.files += $$[QT_INSTALL_PLUGINS]/platforms/qminimald.dll
        libs_qt_to_copy.files += $$[QT_INSTALL_PLUGINS]/platforms/qwindowsd.dll
        libs_qt_to_copy.path = $${DESTDIR}/platforms
        INSTALLS += libs_qt_to_copy
    }else{
        libs_qt_to_copy.files += $$[QT_INSTALL_PLUGINS]/platforms/qminimal.dll
        libs_qt_to_copy.files += $$[QT_INSTALL_PLUGINS]/platforms/qwindows.dll
        libs_qt_to_copy.path = $${DESTDIR}/platforms
        INSTALLS += libs_qt_to_copy
    }
}
