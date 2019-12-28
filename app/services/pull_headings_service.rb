# frozen_string_literal: true

require 'result'

class PullHeadingsService
  def call(author)
    agent = Mechanize.new
    begin
      page = agent.get(author.website)
      elements = page.search('h2')
      if elements.empty?
        Result.new(elements, 'is empty')
      else
        headings = elements.map { |e| e.text.strip }
        author.update(headings: headings)
        Result.new(headings)
      end
    rescue Mechanize::Error => e
      Result.new(nil, e)
    end
  end
end
