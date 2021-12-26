#  enable back/forward mouse buttons in vmware

`path : somepath/Virtual Machines/Ubuntu 64-bit/*.vmx`

```
usb.generic.allowHID = "TRUE"
mouse.vusb.enable = "TRUE"
```

reference

1. [Back / Forward mouse buttons do not work in VMWare](https://superuser.com/questions/35830/back-forward-mouse-buttons-do-not-work-in-vmware-workstation-6-5-guest-os)