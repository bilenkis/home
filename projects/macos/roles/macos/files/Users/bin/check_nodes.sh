echo "TEST:"
kubectl -n test get po -o wide --no-headers | awk '{if ($3!="Running"){ print $7} }' | sort | uniq -c

echo "STAGE:"
kubectl -n stage get po -o wide --no-headers | awk '{if ($3!="Running"){ print $7} }' | sort | uniq -c

echo "PROD:"
kubectl -n production get po -o wide --no-headers | awk '{if ($3!="Running"){ print $7} }' | sort | uniq -c
