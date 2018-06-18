#!/bin/bash
echo "Creating Elastalert index in Elasticsearch..."
echo "python elastalert-create-index --host $elasticHost --port $elasticPort --config $elasticConfigsPath/elastalert_config.yaml --index elastalert_status --old-index """
ls -ltrh /opt/config
ls -ltrh /opt/rules
python /usr/local/bin/elastalert-create-index --host $elasticHost --port $elasticPort --config $elasticConfigsPath/elastalert_config.yaml --index elastalert_status --old-index ""
echo "Starting Elastalert... $DEBUG"
exec supervisord -c $elasticConfigsPath/elastalert_supervisord.conf -n
