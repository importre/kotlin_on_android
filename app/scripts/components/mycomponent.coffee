React = require 'react'
pack  = require '../../../package.json'

Mycomponent = React.createClass
  render: ->
    version = pack.version
    deps    = Object.keys(pack.devDependencies).map (dep, i) => <li key={i}>{dep}</li>

    <div>
      <h1 className="Mycomponent">Welcome to &#9883; React Starterify {version}</h1>
      <p>Powered by:</p>
      <ul>
        {deps}
      </ul>
    </div>

module.exports = Mycomponent
