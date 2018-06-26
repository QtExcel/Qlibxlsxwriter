set(SRC zip.c
        unzip.c
        ioapi.c
        ioapi_mem.c
        ioapi_buf.c)


set(HEADERS zip.h
            unzip.h
            ioapi.h
            crypt.h
            ioapi_mem.h
            ioapi_buf.h
)

if(WIN32)
    set(HEADERS iowin32.h)
    set(SRC iowin32.c)
endif()

add_library(minizip ${SRC} ${HEADERS})
target_link_libraries(minizip ${ZLIB_LIBRARIES})