$domainName = "vclass.local"

# 정방향 조회 도메인 만들기 
# Add-DnsServerPrimaryZone -Name $domainname -ZoneFile "$domainName.dns"

# 역방향 조회 도메인 만들기 
Add-DnsServerPrimaryZone -NetworkID 10.10.13.0/24 -ZoneFile "13.10.10.in-addr.arpa.dns"

# DNS 포워딩 
# Add-DnsServerForwarder -IPAddress 192.168.3.3 -PassThru

# csv 파일로부터, 레코드 정보 읽기 
$csvFile = "C:\Code\dns_record.csv"
$records = Import-Csv $csvfile -Header Hostname, IPAddress

# 정방향과 역방향 레코드 추가 
foreach ($record in $records) {
  $hostname = $record.Hostname
  $ipAddress = $record.IPAddress
  Add-DnsServerResourceRecordA -Name $hostname -ZoneName $domainname -IPv4Address $ipAddress

  $parts = $ipAddress.Split(".")
  $ptrZone = $parts[2] + "." + $parts[1] + "." + $parts[0] + ".in-addr.arpa"
  $hostIP = $parts[3]
  $ptrDomainName = $hostname + "." + $domainName
  Add-DnsServerResourceRecordPtr -Name $hostIP -ZoneName $ptrZone -PtrDomainName $ptrDomainName
} 
