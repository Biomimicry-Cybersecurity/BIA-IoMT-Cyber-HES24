##################################################################
##                         Load RAW Data                        ##
##################################################################
### --- install libraries if needed otherwise activate it --- ###
# to read parquet files
if (!require('arrow')) install.packages('arrow'); library('arrow')
# for everything else
if (!require('tidyverse')) install.packages('tidyverse'); library('tidyverse')

### --- load raw data available on Kaggle (https://www.kaggle.com/datasets/limamateus/cic-iomt-2024-wifi-mqtt)
cic_iomt_2024_wifi_mqtt_test <- read_csv(file = "CIC_IoMT_2024_WiFi_MQTT_test.csv")
cic_iomt_2024_wifi_mqtt_train <- read_csv(file = "CIC_IoMT_2024_WiFi_MQTT_train.csv")

##################################################################
##                         TRAIN SUBSET                         ##
##################################################################
# drop '_train' suffix
cic_iomt_2024_wifi_mqtt_train$label <- gsub("_train", "", cic_iomt_2024_wifi_mqtt_train$label)

# add 3 different labels (binomial, 6 labels, and 19 labels)
cic_iomt_2024_wifi_mqtt_train <- cic_iomt_2024_wifi_mqtt_train %>% 
  mutate(class_label = case_when(label == "Benign" ~ "Benign", TRUE ~ "Attack")) %>% 
  mutate(category_label = case_when(
    str_detect(tolower(label), "spoof") ~ "Spoofing", 
    str_detect(tolower(label), "recon") ~ "Recon",
    str_detect(tolower(label), "mqtt") ~ "MQTT",
    str_detect(tolower(label), "tcp_ip-dos") ~ "Dos",
    str_detect(tolower(label), "tcp_ip-ddos") ~ "DDos",
    TRUE ~ "Benign")) %>% 
  mutate(attack_label = case_when(
    str_detect(tolower(label), "spoof") ~ "ARP_spoofing",
    str_detect(tolower(label), "ping") ~ "ping_sweep",
    str_detect(tolower(label), "vulscan") ~ "VulScan",
    str_detect(tolower(label), "os_scan") ~ "OS_scan",
    str_detect(tolower(label), "port_scan") ~ "Port_scan",
    str_detect(tolower(label), "malformed") ~ "Malformed_date",
    str_detect(tolower(label), "ddos-connect_flood") ~ "DDoS_connect_flood",
    str_detect(tolower(label), "ddos-publish_flood") ~ "DDoS_publish_flood",
    str_detect(tolower(label), "dos-connect_flood") ~ "DoS_connect_flood",
    str_detect(tolower(label), "dos-publish_flood") ~ "DoS_publish_flood",
    str_detect(label, "TCP_IP-DoS-TCP") ~ "DoS_TCP",
    str_detect(label, "TCP_IP-DoS-ICMP") ~ "DoS_ICMP",
    str_detect(label, "TCP_IP-DoS-SYN") ~ "DoS_SYN",
    str_detect(label, "TCP_IP-DoS-UDP") ~ "DoS_UDP",
    str_detect(label, "TCP_IP-DDoS-TCP") ~ "DDoS_TCP",
    str_detect(label, "TCP_IP-DDoS-ICMP") ~ "DDoS_ICMP",
    str_detect(label, "TCP_IP-DDoS-SYN") ~ "DDoS_SYN",
    str_detect(label, "TCP_IP-DDoS-UDP") ~ "DDoS_UDP",
    TRUE ~ "Benign"
  ))

# upload clean train files - choose what type of the file is required
write_csv(x = cic_iomt_2024_wifi_mqtt_train, file = "cic_iomt_2024_wifi_mqtt_train.csv")
arrow::write_parquet(x = cic_iomt_2024_wifi_mqtt_train, sink = "cic_iomt_2024_wifi_mqtt_train.parquet")

##################################################################
##                         TEST SUBSET                          ##
##################################################################
# drop '_train' suffix
cic_iomt_2024_wifi_mqtt_test$label <- gsub("_test", "", cic_iomt_2024_wifi_mqtt_test$label)

# add 3 different labels (binomial, 6 labels, and 19 labels)
cic_iomt_2024_wifi_mqtt_test <- cic_iomt_2024_wifi_mqtt_test %>% 
  mutate(class_label = case_when(label == "Benign" ~ "Benign", TRUE ~ "Attack")) %>% 
  mutate(category_label = case_when(
    str_detect(tolower(label), "spoof") ~ "Spoofing", 
    str_detect(tolower(label), "recon") ~ "Recon",
    str_detect(tolower(label), "mqtt") ~ "MQTT",
    str_detect(tolower(label), "tcp_ip-dos") ~ "Dos",
    str_detect(tolower(label), "tcp_ip-ddos") ~ "DDos",
    TRUE ~ "Benign")) %>% 
  mutate(attack_label = case_when(
    str_detect(tolower(label), "spoof") ~ "ARP_spoofing",
    str_detect(tolower(label), "ping") ~ "ping_sweep",
    str_detect(tolower(label), "vulscan") ~ "VulScan",
    str_detect(tolower(label), "os_scan") ~ "OS_scan",
    str_detect(tolower(label), "port_scan") ~ "Port_scan",
    str_detect(tolower(label), "malformed") ~ "Malformed_date",
    str_detect(tolower(label), "ddos-connect_flood") ~ "DDoS_connect_flood",
    str_detect(tolower(label), "ddos-publish_flood") ~ "DDoS_publish_flood",
    str_detect(tolower(label), "dos-connect_flood") ~ "DoS_connect_flood",
    str_detect(tolower(label), "dos-publish_flood") ~ "DoS_publish_flood",
    str_detect(label, "TCP_IP-DoS-TCP") ~ "DoS_TCP",
    str_detect(label, "TCP_IP-DoS-ICMP") ~ "DoS_ICMP",
    str_detect(label, "TCP_IP-DoS-SYN") ~ "DoS_SYN",
    str_detect(label, "TCP_IP-DoS-UDP") ~ "DoS_UDP",
    str_detect(label, "TCP_IP-DDoS-TCP") ~ "DDoS_TCP",
    str_detect(label, "TCP_IP-DDoS-ICMP") ~ "DDoS_ICMP",
    str_detect(label, "TCP_IP-DDoS-SYN") ~ "DDoS_SYN",
    str_detect(label, "TCP_IP-DDoS-UDP") ~ "DDoS_UDP",
    TRUE ~ "Benign"
  ))

# upload clean train files - choose what type of the file is required
write_csv(x = cic_iomt_2024_wifi_mqtt_test, file = "cic_iomt_2024_wifi_mqtt_test.csv")
write_parquet(x = cic_iomt_2024_wifi_mqtt_test, sink = "cic_iomt_2024_wifi_mqtt_test.parquet")
