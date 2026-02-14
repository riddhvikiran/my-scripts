#!/bin/bash

# nodetool path (change if different)
NODETOOL="/opt/homebrew/opt/cassandra/bin/nodetool"

# Get status
OUTPUT=$($NODETOOL status 2>/dev/null)

# Parse lines with status
echo "# HELP cassandra_node_status Cassandra node status: UN=Up Normal, UJ=Up Joining, DN=Down Normal, etc"
echo "# TYPE cassandra_node_status gauge"

echo "$OUTPUT" | awk '
/^[UD][NJ]/{ 
  status=$1; 
  ip=$2; 
  # normalize to labels
  print "cassandra_node_status{node=\""ip"\",status=\""status"\"} 1"
}'

