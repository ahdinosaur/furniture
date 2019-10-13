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
  const xLength = 160
  const yLength = 180
  const zLength = 300
  const sideBraceLength = 100
  const topBraceLength = 40

  return [
    // left z
    translate(
      [0, 0, (1/2) * pipeOutsideDiameter], 
      zPipe({ length: zLength })
    ),
    // right z
    translate(
      [xLength, 0, (1/2) * pipeOutsideDiameter], 
      zPipe({ length: zLength })
    ),
    // top x
    translate(
      [0, 0, zLength + pipeOutsideDiameter],
      xPipe({ length: xLength })
    ),
    // back bottom x
    translate(
      [0, (1/2) * yLength, 0],
      xPipe({ length: xLength })
    ),
    // front bottom x
    translate(
      [0, -(1/2) * yLength, 0],
      xPipe({ length: xLength })
    ),
    // left bottom y
    translate(
      [0, -(1/2) * yLength, 0],
      yPipe({ length: yLength })
    ),
    // right bottom y
    translate(
      [xLength, -(1/2) * yLength, 0],
      yPipe({ length: yLength })
    ),
    // left back brace
    translate(
      [0, -(sideBraceLength / Math.sqrt(2)) - pipeOutsideDiameter, (1/2) * pipeOutsideDiameter],
      rotate(
        [-45, 0, 0],
        zPipe({ length: sideBraceLength })
      )
    ),
    // left front brace
    translate(
      [0, (sideBraceLength / Math.sqrt(2)) + pipeOutsideDiameter, (1/2) * pipeOutsideDiameter],
      rotate(
        [45, 0, 0],
        zPipe({ length: sideBraceLength })
      )
    ),
    // right back brace
    translate(
      [xLength, -(sideBraceLength / Math.sqrt(2)) - pipeOutsideDiameter, (1/2) * pipeOutsideDiameter],
      rotate(
        [-45, 0, 0],
        zPipe({ length: sideBraceLength })
      )
    ),
    // right front brace
    translate(
      [xLength, (sideBraceLength / Math.sqrt(2)) + pipeOutsideDiameter, (1/2) * pipeOutsideDiameter],
      rotate(
        [45, 0, 0],
        zPipe({ length: sideBraceLength })
      )
    ),
    // top left brace
    translate(
      [(1/2) * pipeOutsideDiameter, 0, zLength - (topBraceLength / Math.sqrt(2))],
      rotate(
        [0, -45, 0],
        xPipe({ length: topBraceLength })
      )
    ),
    // top right brace
    translate(
      [xLength - (1/2) * pipeOutsideDiameter, 0, zLength - (topBraceLength / Math.sqrt(2))],
      rotate(
        [0, -135, 0],
        xPipe({ length: topBraceLength })
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
