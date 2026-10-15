# Run after the restart to confirm the configuration.
hostname                 # expect: DC01
ipconfig /all            # expect: IPv4 192.168.10.10, mask 255.255.255.0, DNS 127.0.0.1, DHCP disabled
Get-TimeZone             # expect: India Standard Time
