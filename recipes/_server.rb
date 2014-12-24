
version = node["mysql"]["version"]

package "mysql-server-#{version}"

service "mysql" do
  supports :status => true, :restart => true, :reload => true
  action :nothing
end

template "/etc/mysql/my.cnf" do
  mode 0644
  owner "root"
  group "root"
  source "mysql-my.cnf.erb"
  notifies :restart, "service[mysql]", :delayed
end

bash 'run_mysql_grant_sql' do
  code <<-EOH
    mysql -u root --password='' < /etc/mysql-grants.sql
    EOH
  action :nothing
end

template "/etc/mysql-grants.sql" do
  mode 0644
  owner "root"
  group "root"
  source "mysql-grants.sql.erb"
  notifies :run, "bash[run_mysql_grant_sql]"
end
