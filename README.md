# cookbook_course_loadbalancer

This cookbook creates a HAProxy load balancer for use with the example sinatra app.

To be able to run tests with Test Kitchen, please create a .kitchen.yml file.
A .kitchen.sample.yml file is provided as template.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['course_loadbalancer']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### course_loadbalancer::default

Include `course_loadbalancer` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[course_loadbalancer::default]"
  ]
}
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
