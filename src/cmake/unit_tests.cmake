include_directories(${PROJECT_SOURCE_DIR}/core)
include_directories(${PROJECT_SOURCE_DIR}/third_party/mavlink/include)

add_executable(unit_tests_runner
    ${UNIT_TEST_SOURCES}
)

target_compile_definitions(unit_tests_runner PRIVATE FAKE_TIME=1)

set_target_properties(unit_tests_runner
    PROPERTIES COMPILE_FLAGS ${warnings}
)

target_link_libraries(unit_tests_runner
    mavsdk
    mavsdk_mission
    mavsdk_camera
    mavsdk_calibration
    tinyxml2::tinyxml2
    gtest
    gtest_main
    gmock
)

if(${BUILD_CURL})
    target_link_libraries(unit_tests_runner
        CURL::libcurl
    )
endif()

add_test(unit_tests unit_tests_runner)
