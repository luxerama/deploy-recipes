def _cset(name, *args, &block)
  unless exists?(name)
    set(name, *args, &block)
  end
end

def _cdefault_run_options(key, value)
  unless default_run_options.has_key? key
    default_run_options[key] = value
  end
end

def _cssh_options(key, value)
  unless ssh_options.has_key? key
    ssh_options[key] = value
  end
end
