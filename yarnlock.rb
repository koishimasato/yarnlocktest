require 'json'
require 'pp'

module TachikomaAi
  module Strategies
    class Yarn
      def pull_request_body
        <<-EOF
## Compare
#{compare_urls}
## Not found
#{homepage_urls}
        EOF
      end

      # private

      def updated_npms
        return @updated_npms if @updated_npms

        previous = lockfile('HEAD^^')
        @updated_npms = diff_specs(previous, lockfile('HEAD')).map do |spec|
          # name
          before = previous.keys.find { |key| key.sub(//) ==  }
          # npm(spec, before)
        end.compact.uniq(&:name)
      end

      def diff_specs(previous, current)
        prev_values = previous.values
        current.reject { |k, v| prev_values.include?(v) }
      end

      def lockfile(ref)
        js = File.expand_path('../yarn-lock-parse.js', __FILE__)
        JSON.parse(`git show #{ref}:yarn.lock | node #{js}`)
      end

      def compare_urls
        updated_npms.select(&:github_url?).map { |npm| url_with_checkbox(npm.compare_url) }.join("\n")
      end

      def url_with_checkbox(url)
        "- [ ] #{url}"
      end

      def homepage_urls
        updated_npms.reject(&:github_url?).map(&:homepage).join("\n")
      end

      def npm(spec, before)
        return if before.nil?
        npm.new(spec.name, before.version.to_s, spec.version.to_s)
      end
    end
  end
end


yarn = TachikomaAi::Strategies::Yarn.new
# pp yarn.lockfile('HEAD').values
# pp yarn.lockfile('HEAD^').keys

pp yarn.diff_specs(yarn.lockfile('HEAD^^'), yarn.lockfile('HEAD'))
# yarn.updated_npms
#p `yarn parse --silent`


