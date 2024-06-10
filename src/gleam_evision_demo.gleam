import evision/evision as cv
import evision/highgui
import evision/mat.{type Mat}
import gleam/erlang/process
import gleam/io

fn spin(image: Mat, height: Int, width: Int, angle: Float) {
  let rot_mat = cv.getrotationmatrix2d(#(height / 2, width / 2), angle, 1.0)
  let result = cv.warpaffine3(image, rot_mat, #(height, width))
  highgui.imshow("Gleam!", result)
  highgui.wait_key(1)
  process.sleep(5)
  spin(image, height, width, angle +. 2.0)
}

pub fn main() {
  let mat: Mat = cv.imread1("lucyhappy.png")
  case mat.shape {
    [height, width, _] -> {
      spin(mat, height, width, 0.0)
      process.sleep_forever()
      io.debug("Done!")
    }
    _ -> {
      io.debug("Failed to read image")
    }
  }
}
