#if defined(_WIN32) && defined(_MSC_VER)
#pragma comment(linker, "/SUBSYSTEM:WINDOWS")
#pragma comment(linker, "/ENTRY:mainCRTStartup")
#endif

void moonbit_windows_subsystem_enable(void) {}
