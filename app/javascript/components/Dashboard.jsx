import React from "react"
import PropTypes from "prop-types"
import InfluencerBlock from './InfluencerBlock'

class Dashboard extends React.Component {
  render () {
    return (
      <div>
        {this.props.influencers.map(influencer => (
          <InfluencerBlock key={influencer.id} {...influencer} />
        ))}
      </div>
    );
  }
}

export default Dashboard
