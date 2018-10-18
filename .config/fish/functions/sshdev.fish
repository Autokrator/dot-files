function sshdev -d "ssh helper for machines in dev cluster"
  ssh -tt v5dev inline $argv
end
