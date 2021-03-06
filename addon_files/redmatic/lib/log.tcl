catch {exec /usr/local/addons/redmatic/bin/redmaticVersions} result
puts $result
puts ""

catch {exec df -h} result
puts $result
puts ""

catch {exec du -sh /usr/local/addons/redmatic/var /usr/local/addons/redmatic/lib /usr/local/addons/redmatic/tmp} result
puts $result
puts ""

catch {exec top -b -n1 | grep -v "\]$"} result
puts $result
puts ""

catch {exec netstat -tulpen | grep node} result
puts $result
puts ""

catch {exec /usr/sbin/iptables -L INPUT -vn} result
puts $result
puts ""

if {[file exists /usr/local/addons/redmatic/var/pkg-upgrade.log]} {
    catch {exec cat /usr/local/addons/redmatic/var/pkg-upgrade.log} result
    puts $result
    puts ""
}

if {[file exists /var/log/messages.0]} {
    catch {exec cat /var/log/messages.0 | grep node-red\\|redmatic } result
    puts $result
}
catch {exec cat /var/log/messages | grep node-red\\|redmatic} result
puts $result