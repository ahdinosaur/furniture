const { cylinder, cube, sphere } = require('@jscad/csg/api').primitives3d
const { circle } = require('@jscad/csg/api').primitives2d
const { difference, union, intersection } = require('@jscad/csg/api').booleanOps
const { translate, scale, rotate } = require('@jscad/csg/api').transformations
const { linear_extrude } = require('@jscad/csg/api').extrusions

const INSIDE_DIAMETER = 3.20
const OUTSIDE_DIAMETER = 4.24
const CIRCLE_RESOLUTION = 16

module.exports = { main }

function main () {
  const pipeOutsideDiameter = OUTSIDE_DIAMETER

  return [
    // left z
    translate(
      [0, 0, (1/2) * pipeOutsideDiameter], 
      zPipe({ length: 300 })
    ),
    // right z
    translate(
      [150, 0, (1/2) * pipeOutsideDiameter], 
      zPipe({ length: 300 })
    ),
    // top x
    translate(
      [0, 0, 300 + pipeOutsideDiameter],
      xPipe({ length: 150 })
    ),
    // back bottom x
    translate(
      [0, 90, 0],
      xPipe({ length: 150 })
    ),
    // front bottom x
    translate(
      [0, -90, 0],
      xPipe({ length: 150 })
    ),
    // left bottom y
    translate(
      [0, -90, 0],
      yPipe({ length: 180 })
    ),
    // right bottom y
    translate(
      [150, -90, 0],
      yPipe({ length: 180 })
    ),
    // left back brace
    translate(
      [0, -67, (1/2) * pipeOutsideDiameter],
      rotate(
        [-45, 0, 0],
        zPipe({ length: 90 })
      )
    ),
    // left front brace
    translate(
      [0, 67, (1/2) * pipeOutsideDiameter],
      rotate(
        [45, 0, 0],
        zPipe({ length: 90 })
      )
    ),
    // right back brace
    translate(
      [150, -67, (1/2) * pipeOutsideDiameter],
      rotate(
        [-45, 0, 0],
        zPipe({ length: 90 })
      )
    ),
    // right front brace
    translate(
      [150, 67, (1/2) * pipeOutsideDiameter],
      rotate(
        [45, 0, 0],
        zPipe({ length: 90 })
      )
    ),
    // top left brace
    translate(
      [(1/2) * pipeOutsideDiameter, 0, 276 + pipeOutsideDiameter],
      rotate(
        [0, -45, 0],
        xPipe({ length: 30 })
      )
    ),
    // top right brace
    translate(
      [150 - (1/2) * pipeOutsideDiameter, 0, 276 + pipeOutsideDiameter],
      rotate(
        [0, -135, 0],
        xPipe({ length: 30 })
      )
    ),
  ]
}

function xPipe (options) {
  return rotate(
    [0, 90, 0],
    zPipe(options)
  )
}

function yPipe (options) {
  return rotate(
    [-90, 0, 0],
    zPipe(options)
  )
}

function zPipe (options) {
  const {
    length,
    insideDiameter = INSIDE_DIAMETER,
    outsideDiameter = OUTSIDE_DIAMETER,
    circleResolution = CIRCLE_RESOLUTION,
  } = options

  return linear_extrude(
    { height: length },
    difference(
      circle({ r: outsideDiameter / 2, resolution: circleResolution, center: true }),
      circle({ r: insideDiameter / 2, resolution: circleResolution, center: true })
    )
  )
}
