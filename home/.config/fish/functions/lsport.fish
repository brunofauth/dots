function lsport --description alias\ lsport\ sudo\ ss\ -lptn\ \'sport\ =\ :\'
  sudo ss -lptn "sport = :$argv[1]"
end
