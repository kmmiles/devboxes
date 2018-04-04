#!/bin/bash -e

URL="https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/oxygen/2/eclipse-jee-oxygen-2-linux-gtk-x86_64.tar.gz&r=1"

cd /Downloads

curl -Lo "eclipse.tar.gz" "$URL"
sudo tar xvfz "eclipse.tar.gz" -C /opt
sudo chmod -R +r /opt/eclipse

cat > eclipse <<EOF
#!/bin/sh
export ECLIPSE_HOME="/opt/eclipse"

\$ECLIPSE_HOME/eclipse \$*
EOF

sudo mv eclipse /usr/bin/eclipse
chmod +x /usr/bin/eclipse
