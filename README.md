# Attractor

## Introduction:
- EN: The Processing code in the attachment can help you showcase the magical and strange attractors. Here, take the classic Lorentz attractor as an example.

- CN: 附件的Processing代码可以帮助你对神奇的奇异吸引子进行展示。这里以经典的洛伦兹吸引子为例。

![gif1](LorenzAttractor.gif)

- EN：The differential equation system of Lorentz attractor is as follows, where x, y, and z represent coordinate positions.

- CN: 洛伦兹吸引子的微分方程组如下。其中x，y和z代表坐标位置。

```Processing
dx = (a * (s.init_pos.y - s.init_pos.x)) * dt;
dy = (s.init_pos.x * (b - s.init_pos.z) - s.init_pos.y) * dt;
dz = (s.init_pos.x * s.init_pos.y - c * s.init_pos.z) * dt;
```

## Design Ideas:
- EN：I first defined a class called "Attractor", which has two attributes: one is the position vector, and the other is a list of vectors used to record all positions. Afterwards, I initialize any number of "Attractor" objects and store it with a list named "attractors" in the main program. Then, I use the Euler method to update the position of each "Attractor" object and record the updated position in the list of objects. Finally, the "vertex" function can be used to depict the points in the list as curves. The automatic rotation of images mainly uses the Camera function.

- CN：我首先定义了一个名为“Attractor”的类，它拥有两个属性，一个是位置向量，另一个是用来记录所有位置的向量列表。之后，在“LorenzAttractor”这个类中，首先初始化任意个“Attractor”对象，并用一个名为“attractors”的列表进行存储。然后，我使用欧拉法对每一个“Attractor”对象的位置进行更新，并将更新后的位置记录在对象的列表之中。最后，用“vertex”函数将列表中的点描绘成曲线。图像的自动旋转主要是用到了Camera函数。

