---
layout: post
title: "Mbed 6 Targets List"
date: 2021-01-08
tags: linux environment admin
image: https://images.unsplash.com/photo-1496096265110-f83ad7f96608
thumb: https://images.unsplash.com/photo-1496096265110-f83ad7f96608?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@christopher__burns
type: article
---

A list of Mbed Targets

<style> 
  th p.vcell {
    /*! width: 50%; */
    height: initial;
    /*! height: 50%; */
    /*! transform: rotate(-45deg); */

    /* background: red !important;  */
    top: 50%;
    left: 50%;
    position: relative;
  }

  th {
    /*! margin: 0 15px; */
    /*! position: relative; */
    /*! display: table-cell; */
    width: 14px;
    height: 14px;
  }

  th .tc, td.tc {
    color: blue;
  }

  td.tc {
    background-color: aliceblue;
  }

  th .feature, td.feature {
    color: red;
  }

  td.feature {
    background-color: #ffdddd;
  }

  .vcell {
    transform: translateX(-50%) translateY(-50%) rotate(-45deg); 
    /* display: block; */
    height: 40px;
    width: 20px;
    /* text-align: center;
    vertical-align: text-bottom; */
    white-space:nowrap;
    /* position: absolute; */
    top: 50%;
    left: 50%;
  }

  /* th p.vcell {
    /* width: 14px; */
    /* height: 200px; */
    /* height: 60px; */
    /* transform: rotate(90deg);

    background: red !important;  */
  /*} */

  .ncell {
    border: solid 1px lightgray;
    width: 120px;
    text-align: center;
    white-space:nowrap;
  }
</style>

<table>
<!-- <tr>
    <th colspan="2"></th>
    <th>Toolchains</th>
    <th colspan="4">Toolchains</th>
    <th>Features</th>
    <th colspan="3">Features</th>
    <th>Device Has</th>
    <th colspan="19">Device Has</th>
</tr> -->
<tr>
    <th>Item</th>
    <th>Core</th>
    <!-- <th>Toolchains</th> -->
    <th><p class="vcell tc">ARM</p></th>
    <th><p class="vcell tc">IAR</p></th>
    <th><p class="vcell tc">GCC_ARM</p></th>
    <th><p class="vcell tc">ARMc6</p></th>
    <!-- <th>Features</th> -->    
    <th><p class="vcell feature">BLE</p></th>
    <th><p class="vcell feature">CRYPTOCELL310</p></th>
    <th><p class="vcell feature">PSA</p></th>
    <!-- DeviceHas -->
    <th><p class="vcell">AACI</p></th>
    <th><p class="vcell">ANALOG IN</p></th>
    <th><p class="vcell">ANALOG OUT</p></th>
    <th><p class="vcell">CLCD</p></th>
    <th><p class="vcell">DEBUG AWARENESS</p></th>
    <th><p class="vcell">ETHERNET</p></th>
    <th><p class="vcell">FLASH</p></th>
    <th><p class="vcell">I2C</p></th>
    <th><p class="vcell">I2C SLAVE</p></th>
    <th><p class="vcell">INTERRUPT IN</p></th>
    <th><p class="vcell">MPU</p></th>
    <th><p class="vcell">RESET REASON</p></th>
    <th><p class="vcell">RTC</p></th>
    <th><p class="vcell">PORT IN</p></th>
    <th><p class="vcell">PORT IN OUT</p></th>
    <th><p class="vcell">PORT OUT</p></th>    
    <th><p class="vcell">PWMOUT</p></th>
    <th><p class="vcell">SLEEP</p></th>
    <th><p class="vcell">SPI</p></th>
    <th><p class="vcell">SPI SLAVE</p></th>
    <th><p class="vcell">SPI ASYNC</p></th>
    <th><p class="vcell">TSC</p></th>
    <th><p class="vcell">WATCHDOG</p></th>
</tr>

{% assign sorted_mcus = site.data.microcontrollers.mbed_os_targets | sort %}
{% for member in sorted_mcus %}
{% assign item = member[0] %}
{% assign org = member[1] %}
  <tr>
    <td>{{item}}</td>
    <td nowrap>{{ org.core }}</td>
    <!-- <td>{{org.supported_toolchains | join: ", "}}</td> -->
    <td class="ncell tc">{%if org.supported_toolchains contains "ARM" %}X{% endif %}</td>
    <td class="ncell tc">{%if org.supported_toolchains contains "IAR" %}X{% endif %}</td>
    <td class="ncell tc">{%if org.supported_toolchains contains "GCC_ARM" %}X{% endif %}</td>
    <td class="ncell tc">{%if org.supported_toolchains contains "ARMC6" %}X{% endif %}</td>
    <!-- Features -->
    <td class="ncell feature">{%if org.features contains "BLE" %}X{% endif %}</td>
    <td class="ncell feature">{%if org.features contains "CRYPTOCELL310" %}X{% endif %}</td>
    <td class="ncell feature">{%if org.features contains "PSA" %}X{% endif %}</td>
    <!-- Device Has -->
    <td class="ncell">{%if org.device_has contains "AACI" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "ANALOGIN" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "ANALOGOUT" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "CLCD" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "DEBUG_AWARENESS" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "ETHERNET" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "FLASH" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "I2C" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "I2CSLAVE" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "INTERRUPTIN" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "MPU" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "RESET_REASON" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "RTC" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "PORTIN" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "PORTINOUT" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "PORTOUT" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "PWMOUT" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "SLEEP" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "SPI" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "SPISLAVE" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "SPI_ASYNCH" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "TSC" %}X{% endif %}</td>
    <td class="ncell">{%if org.device_has contains "WATCHDOG" %}X{% endif %}</td> 
    <!-- <td>{{org.features | join: ", " }}</td> -->
    <!-- <td>{{org.device_has | join: ", "}}</td> -->
  </tr>
{% endfor %}
</table>

[Source: Mbed OS targets.json](https://github.com/ARMmbed/mbed-os/blob/master/targets/targets.json)

[License: Apache 2.0](https://raw.githubusercontent.com/ARMmbed/mbed-os/master/LICENSE-apache-2.0.txt)