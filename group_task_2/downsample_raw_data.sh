 #!/bin/bash

while read -r sample url; do 
  echo "Extracting 2 million reads from $sample..."
  zless $sample"_raw.fq.gz" | sed -n 1,8000000p > $sample".fq"
  echo "Compressing $sample subset..."
  gzip $sample".fq"
done < samples.txt
echo "Done"