#!/bin/bash


    export LOCAL_JMX=no
    mkdir -p /home/circleci/.local
    cp src/ci/jmxremote.password /home/circleci/.local/jmxremote.password
    chmod 400 /home/circleci/.local/jmxremote.password
    cat /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/management/jmxremote.access
    sudo chmod 777 /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/management/jmxremote.access
    echo "cassandra     readwrite" >> /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/management/jmxremote.access
    cat /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/management/jmxremote.access
    ccm create test -v $CASSANDRA_VERSION
    ccm populate --vnodes -n 2:2
    sed -i 's/etc\/cassandra\/jmxremote.password/home\/circleci\/.local\/jmxremote.password/' /home/circleci/.ccm/test/node1/conf/cassandra-env.sh
    sed -i 's/etc\/cassandra\/jmxremote.password/home\/circleci\/.local\/jmxremote.password/' /home/circleci/.ccm/test/node2/conf/cassandra-env.sh
    sed -i 's/#MAX_HEAP_SIZE="4G"/MAX_HEAP_SIZE="192m"/' /home/circleci/.ccm/test/node1/conf/cassandra-env.sh
    sed -i 's/#MAX_HEAP_SIZE="4G"/MAX_HEAP_SIZE="192m"/' /home/circleci/.ccm/test/node2/conf/cassandra-env.sh
    sed -i 's/#MAX_HEAP_SIZE="4G"/MAX_HEAP_SIZE="192m"/' /home/circleci/.ccm/test/node3/conf/cassandra-env.sh
    sed -i 's/#MAX_HEAP_SIZE="4G"/MAX_HEAP_SIZE="192m"/' /home/circleci/.ccm/test/node4/conf/cassandra-env.sh
    sed -i 's/_timeout_in_ms:.*/_timeout_in_ms: 60000/' /home/circleci/.ccm/test/node1/conf/cassandra.yaml
    sed -i 's/_timeout_in_ms:.*/_timeout_in_ms: 60000/' /home/circleci/.ccm/test/node2/conf/cassandra.yaml
    sed -i 's/_timeout_in_ms:.*/_timeout_in_ms: 60000/' /home/circleci/.ccm/test/node3/conf/cassandra.yaml
    sed -i 's/_timeout_in_ms:.*/_timeout_in_ms: 60000/' /home/circleci/.ccm/test/node4/conf/cassandra.yaml
    sed -i 's/start_rpc: true/start_rpc: false/' /home/circleci/.ccm/test/node1/conf/cassandra.yaml
    sed -i 's/start_rpc: true/start_rpc: false/' /home/circleci/.ccm/test/node2/conf/cassandra.yaml
    sed -i 's/start_rpc: true/start_rpc: false/' /home/circleci/.ccm/test/node3/conf/cassandra.yaml
    sed -i 's/start_rpc: true/start_rpc: false/' /home/circleci/.ccm/test/node4/conf/cassandra.yaml
    sed -i 's/cross_node_timeout: false/cross_node_timeout: true/' /home/circleci/.ccm/test/node1/conf/cassandra.yaml
    sed -i 's/cross_node_timeout: false/cross_node_timeout: true/' /home/circleci/.ccm/test/node2/conf/cassandra.yaml
    sed -i 's/cross_node_timeout: false/cross_node_timeout: true/' /home/circleci/.ccm/test/node3/conf/cassandra.yaml
    sed -i 's/cross_node_timeout: false/cross_node_timeout: true/' /home/circleci/.ccm/test/node4/conf/cassandra.yaml
    sed -i 's/concurrent_reads: 32/concurrent_reads: 2/' /home/circleci/.ccm/test/node1/conf/cassandra.yaml
    sed -i 's/concurrent_reads: 32/concurrent_reads: 2/' /home/circleci/.ccm/test/node2/conf/cassandra.yaml
    sed -i 's/concurrent_reads: 32/concurrent_reads: 2/' /home/circleci/.ccm/test/node3/conf/cassandra.yaml
    sed -i 's/concurrent_reads: 32/concurrent_reads: 2/' /home/circleci/.ccm/test/node4/conf/cassandra.yaml
    sed -i 's/concurrent_writes: 32/concurrent_writes: 2/' /home/circleci/.ccm/test/node1/conf/cassandra.yaml
    sed -i 's/concurrent_writes: 32/concurrent_writes: 2/' /home/circleci/.ccm/test/node2/conf/cassandra.yaml
    sed -i 's/concurrent_writes: 32/concurrent_writes: 2/' /home/circleci/.ccm/test/node3/conf/cassandra.yaml
    sed -i 's/concurrent_writes: 32/concurrent_writes: 2/' /home/circleci/.ccm/test/node4/conf/cassandra.yaml
    sed -i 's/concurrent_counter_writes: 32/concurrent_counter_writes: 2/' /home/circleci/.ccm/test/node1/conf/cassandra.yaml
    sed -i 's/concurrent_counter_writes: 32/concurrent_counter_writes: 2/' /home/circleci/.ccm/test/node2/conf/cassandra.yaml
    sed -i 's/concurrent_counter_writes: 32/concurrent_counter_writes: 2/' /home/circleci/.ccm/test/node3/conf/cassandra.yaml
    sed -i 's/concurrent_counter_writes: 32/concurrent_counter_writes: 2/' /home/circleci/.ccm/test/node4/conf/cassandra.yaml
    sed -i 's/num_tokens: 256/num_tokens: 32/' /home/circleci/.ccm/test/node1/conf/cassandra.yaml
    sed -i 's/num_tokens: 256/num_tokens: 32/' /home/circleci/.ccm/test/node2/conf/cassandra.yaml
    sed -i 's/num_tokens: 256/num_tokens: 32/' /home/circleci/.ccm/test/node3/conf/cassandra.yaml
    sed -i 's/num_tokens: 256/num_tokens: 32/' /home/circleci/.ccm/test/node4/conf/cassandra.yaml
    ccm start -v
    ccm status
    ccm checklogerror
