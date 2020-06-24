Configuration SetFirewallRule
{
  param ($MachineName)

  Import-DSCResource -ModuleName xNetworking

  Node $MachineName
  {
    xFirewall Firewall1433
    {
        Name                  = 'SQLFirewallRule'
        DisplayName           = 'Firewall Rule for SQL Server'
        Group                 = 'SQL Firewall Rule Group'
        Ensure                = 'Present'
        Enabled               = 'True'
        Profile               = ('Domain', 'Private')
        Direction             = 'Inbound'
        LocalPort             = ('1433')
        Protocol              = 'TCP'
        Description           = 'Firewall Rule for SQL Server'
    }
  }
} 