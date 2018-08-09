*** Settings ***
Library                SSHLibrary
Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections

*** Variables ***
${HOST}                leaf1
${USERNAME}            cumulus
${PASSWORD}            ***

*** Test Cases ***
Open Connection And Log In
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}

Internet Connectivity Ping Test
    [Documentation]    Ping Test To 1.1.1.1
    ${output}=         Execute Command    ping 1.1.1.1 -c 1
    Should Contain     ${output}          64 bytes from 1.1.1.1

MLAG Status Check
    [Documentation]    Check MLAG Health
    ${output}=         Execute Command    net show clag
    Should Contain     ${output}          The peer is alive

Spanning Tree Status Check
    [Documentation]    Check STP Health
    ${output}=         Execute Command    net show bridge spanning-tree json
    Should Contain     ${output}          "rootPortName": "peerlink"

BGP Health Check
    [Documentation]    Check BGP State
    ${output}=         Execute Command    net show bgp neighbor
    Should Contain     ${output}          BGP state = Established

*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}        ${PASSWORD}

