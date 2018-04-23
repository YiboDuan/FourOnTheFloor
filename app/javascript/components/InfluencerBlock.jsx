import React from "react"
import PropTypes from "prop-types"
import PostFragment from './PostFragment'

class InfluencerBlock extends React.Component {
  render () {
    return (
      <div key={this.props.id} class='card'>
        <ul class="nav nav-tabs nav-tabs-neutral justify-content-center" role="tablist" data-background-color="orange">
          <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href={'summary' + this.props.id} role="tab">Summary</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href={'posts' + this.props.id} role="tab">Posts</a>
          </li>
        </ul>
        <div class='card body'>
          <div class="tab-content text-center">
            <div class="tab-pane active" id={'summary' + this.props.id} role="tabpanel">
              <div>{this.props.username}</div>
            </div>
            <div class="tab-pane" id={'posts' + this.props.id} role="tabpanel">
              <PostFragment posts={this.props.posts}/>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

InfluencerBlock.propTypes = {
  username: PropTypes.string,
  posts: PropTypes.arrayOf(PropTypes.object)
};
export default InfluencerBlock
