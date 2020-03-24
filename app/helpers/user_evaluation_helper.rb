# frozen_string_literal: true

module UserEvaluationHelper
  def link_to_evaluations(type)
    if type == 'Evaluations::Repository'
      link_to('Repository', evaluations_repositories_path)
    else
      link_to('Pull Request', evaluations_pull_requests_path)
    end
  end
end
