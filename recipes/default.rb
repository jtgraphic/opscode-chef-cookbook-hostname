dashed_name = node.name.split(".").join("-").split("_").join("-")

file "/etc/hostname" do
    owner "root"
    group "root"
    mode 0644
    content dashed_name
end

hostsfile_entry '127.0.0.1' do
    hostname  dashed_name
    comment   'Appended by hostname cookbook.'
    action    :append
end

Execute "hostname -F /etc/hostname"
