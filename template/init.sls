{% from 'base/map.jinja' import base, includes with context %}

{% for pkg in base.packages %}
pkg_{{ pkg }}:
  pkg.installed:
    - name: {{ pkg }}
{% endfor %}

{% if includes %}
include:
{% for include in includes %}
  - base.{{ include }}
{% endfor %} 
{% endif %}

{% if grains['os_family'] == 'FreeBSD' %}
python_cert_symlink:
  file.symlink:
    - name: /etc/ssl/cert.pem
    - target: /usr/local/etc/ssl/cert.pem
{% endif %}
