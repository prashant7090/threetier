sleep 30
LBNAME=`/usr/local/bin/kubectl describe service frontend|grep Ingress|awk '{print $NF}'`
sed -i "s/FELBNAME/$LBNAME/g" dns.json
aws route53 change-resource-record-sets --hosted-zone-id Z2VPD3S1OO9U30 --change-batch file://dns.json 
#(In above line, replace "Z2VPD3S1OO9U30" zoneid with route53 zone id. 
