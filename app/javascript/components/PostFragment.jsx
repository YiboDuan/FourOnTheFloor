import React from "react"
import PropTypes from "prop-types"

class PostFragment extends React.Component {
  render () {
    return (
      <React.Fragment>
        {this.props.posts.map(post =>(
          <React.Fragment key={post.id}>
            <div>{post.caption}</div>
            <div>{post.date}</div>
          </React.Fragment>
        ))}
      </React.Fragment>
    );
  }
}

PostFragment.propTypes = {
  posts: PropTypes.arrayOf(PropTypes.object)
};
export default PostFragment
