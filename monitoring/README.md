# grafana (visualizing) and prometheus (collecting data)
## installation of grafana and prometheus
1
``` bash
1. sudo apt update
2. sudo apt upgrade -y
3. sudo apt install -y apt-transport-https software-properties-common wget
4. sudo wget -q -O /usr/share/keyrings/grafana.key https://packages.grafana.com/gpg.key
5. echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
6. sudo apt update
7. sudo apt install grafana -y
8. sudo systemctl daemon-reload
9. sudo systemctl start grafana-server
10. sudo systemctl status grafana-server
11. sudo systemctl enable grafana-server
12. sudo apt install prometheus prometheus-node-exporter -y
13. sudo systemctl enable --now prometheus prometheus-node-exporter

``` 
2. open localhost:3000 for grafana and localhost:9090 for prometheus

## first dashboard
1. open localhost:3000 and login with admin/admin
2. menu -> connections -> search prometheus
3. add prometheus server -> http://localhost:9090 on add new data source
4. save and test 


