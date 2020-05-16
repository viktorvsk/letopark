# frozen_string_literal: true

# We don't use either secrets.yml or credentials.yml.enc + master.key
# So we don't need SECRET_KEY_BASE ENV
# However, Rails currently has a bug: https://github.com/rails/rails/issues/32413

ENV['SECRET_KEY_BASE'] = SecureRandom.hex
