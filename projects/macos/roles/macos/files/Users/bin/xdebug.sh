#!/bin/bash
IP="192.168.99.1"
FILE="/Library/LaunchDaemons/com.runlevel1.lo0.$IP.plist"

cat > $FILE <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
      <key>Label</key>
      <string>com.runlevel1.lo0.$IP</string>
      <key>RunAtLoad</key>
      <true/>
      <key>ProgramArguments</key>
      <array>
          <string>/sbin/ifconfig</string>
          <string>lo0</string>
          <string>alias</string>
          <string>$IP</string>
					<string>up</string>
      </array>
      <key>StandardErrorPath</key>
      <string>/var/log/loopback-alias.log</string>
      <key>StandardOutPath</key>
      <string>/var/log/loopback-alias.log</string>
      <key>UserName</key>
      <string>root</string>
  </dict>
</plist>
EOF
chmod 644 $FILE
chown root:wheel $FILE
launchctl load $FILE
