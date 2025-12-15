import UserController from './UserController'
import RoleController from './RoleController'
import PackageController from './PackageController'
import SubpackageController from './SubpackageController'
import Settings from './Settings'
const Controllers = {
    UserController: Object.assign(UserController, UserController),
RoleController: Object.assign(RoleController, RoleController),
PackageController: Object.assign(PackageController, PackageController),
SubpackageController: Object.assign(SubpackageController, SubpackageController),
Settings: Object.assign(Settings, Settings),
}

export default Controllers