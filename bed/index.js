const { cylinder, cube, sphere } = require('@jscad/csg/api').primitives3d
const { circle } = require('@jscad/csg/api').primitives2d
const { difference, union, intersection } = require('@jscad/csg/api').booleanOps
const { translate, scale, rotate } = require('@jscad/csg/api').transformations
const { linear_extrude } = require('@jscad/csg/api').extrusions

const INSIDE_DIAMETER = 3.20
const OUTSIDE_DIAMETER = 4.24
const CIRCLE_RESOLUTION = 16

const ROT_RADS = Math.PI * 2
const ROT_DEGS = 360

module.exports = { main }

function main () {
  const pipeOutsideDiameter = OUTSIDE_DIAMETER
  const bedHeight = 60
  const xLength = 203
  const yLength = 150
  const zLength = 220

  return [
    // bottom x
    translate(
      [0, 0, bedHeight],
      xPipe({ length: xLength })
    ),
    translate(
      [0, (1/2) * yLength, bedHeight],
      xPipe({ length: xLength })
    ),
    translate(
      [0, yLength, bedHeight], 
      xPipe({ length: xLength })
    ),
    // top x
    translate(
      [0, 0, zLength], 
      xPipe({ length: xLength })
    ),
    translate(
      [0, yLength, zLength], 
      xPipe({ length: xLength })
    ),
    // bottom y
    translate(
      [0, 0, bedHeight], 
      yPipe({ length: yLength })
    ),
    translate(
      [xLength, 0, bedHeight], 
      yPipe({ length: yLength })
    ),
    // top y
    translate(
      [0, 0, zLength], 
      yPipe({ length: yLength })
    ),
    translate(
      [xLength, 0, zLength], 
      yPipe({ length: yLength })
    ),
    // z
    translate(
      [0, 0, 0], 
      zPipe({ length: zLength })
    ),
    translate(
      [xLength, 0, 0], 
      zPipe({ length: zLength })
    ),
    translate(
      [0, yLength, 0], 
      zPipe({ length: zLength })
    ),
    translate(
      [xLength, yLength, 0], 
      zPipe({ length: zLength })
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
