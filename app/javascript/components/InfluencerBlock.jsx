import React from "react"
import PropTypes from "prop-types"
import PostFragment from './PostFragment'

class InfluencerBlock extends React.Component {
  render () {
    return (
      <div key={this.props.id}>
        <div>{this.props.username}</div>
        <PostFragment posts={this.props.posts}/>
      </div>
    );
  }
}

InfluencerBlock.propTypes = {
  username: PropTypes.string,
  posts: PropTypes.arrayOf(PropTypes.object)
};
export default InfluencerBlock
