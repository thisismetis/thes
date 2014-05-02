require 'spec_helper'

describe Searcher, '#profiles' do
  it 'takes 2 inputs and returns only talent profiles matching both inputs' do
    matching_profile_1 = create(:talent_profile, proficiencies: [
      rails_proficiency, css_proficiency
    ])
    matching_profile_2 = create(:talent_profile, proficiencies: [
      rails_proficiency, css_proficiency
    ])
    not_matching_profile = create(:talent_profile, proficiencies: [
      css_proficiency
    ])
    search_params = {
      query: { '0' => 'rails', '1' => 'css' },
      level: { '0' => 3, '1' => 2 }
    }

    searcher = Searcher.new(search_params)
    profiles = searcher.profiles


    expect(profiles).to include matching_profile_1
    expect(profiles).to include matching_profile_2
    expect(profiles).not_to include not_matching_profile
  end

  private

  def rails_proficiency
    rails_skill = create(:skill, name: 'Ruby on Rails')
    create(:proficiency, skill: rails_skill, level: 3)
  end

  def css_proficiency
    css_skill = create(:skill, name: 'CSS3')
    create(:proficiency, skill: css_skill, level: 2)
  end
end
