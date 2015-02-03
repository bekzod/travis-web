`import Ember from 'ember'`
`import colorForState from 'travis/utils/helpers'`

View = Ember.CollectionView.extend
  elementId: 'repos'
  tagName: 'ul'

  emptyView: Ember.View.extend
    template: Ember.Handlebars.compile('<div class="loading"><span>Loading</span></div>')

  itemViewClass: Ember.View.extend
    repoBinding: 'content'
    classNames: ['repo']
    classNameBindings: ['color', 'selected']
    selected: (->
      @get('content') == @get('controller.selectedRepo')
    ).property('controller.selectedRepo')

    color: (->
      # TODO: temp comment
      #colorForState(@get('repo.lastBuildState'))
    ).property('repo.lastBuildState')

    click: ->
      @get('controller').transitionToRoute('/' + @get('repo.slug'))

`export default View`
