
#!/bin/bash

cat << EOF | sudo tee /Library/LaunchDaemons/com.enable.boot.noatime.plist > /dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.enable.boot.noatime</string>
    <key>ProgramArguments</key>
    <array>
        <string>mount</string>
        <string>-vuwo</string>
        <string>noatime</string>
        <string>/</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF
