*** Settings ***
Documentation     Post Maintenance Change Suite
Resource          resource.robot
Suite Setup       Open Connection And Log In
Suite Teardown    Close All Connections


*** Test Cases ***
Layer 2 Tests
    MLAG Status Check
    Spanning Tree Status Check

Layer 3 Tests
    Internet Connectivity Ping Test
    BGP Health Check
    

