#!/bin/bash -x

# Define the start, end, and step values for the range
start=2
end=$(wc -l <$1)
step=2
i=$start

# Loop over the range
#while [[ $n <= $(wc -l $1) ]]; do
for ((n=1; n<=end; n+=1)); do
    (( i+=step ))   
    
    if [[ "$n" == 1 ]]; then sed -n "${n}p" $1 >>$2; continue; fi
    # Convert the integer to a floating-point number
    export float=$(bc <<< "scale=1; $i/10")
    echo $float
    sed -n "${n}p" "$1" | jq -c ".[0]=$float" >> "$2"
    # (( n++ ))
done
