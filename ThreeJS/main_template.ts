// https://std9.jp/articles/01g1vzvvrragrgbbk4x8s3564e

const appElement = document.querySelector<HTMLDivElement>('#appElement')!;

import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import { Scene } from 'three';

const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setClearColor(0xffffff, 1.0);
renderer.setPixelRatio(window.devicePixelRatio);
renderer.setSize(appElement.offsetWidth, appElement.offsetHeight);
appElement.appendChild(renderer.domElement);

const axes = new THREE.AxesHelper();

const scene = new Scene();
scene.add(axes);

const camera = new THREE.PerspectiveCamera(50, appElement.offsetWidth / appElement.offsetHeight);
camera.position.set(1, 1, 1);
camera.lookAt(scene.position);

const orbitControls = new OrbitControls(camera, renderer.domElement);
orbitControls.maxPolarAngle = Math.PI * 0.5;
orbitControls.minDistance = 0.1;
orbitControls.maxDistance = 100;
orbitControls.autoRotate = true;     
orbitControls.autoRotateSpeed = 1.0;

renderer.setAnimationLoop(() => {
  orbitControls.update();
  renderer.render(scene, camera);
});