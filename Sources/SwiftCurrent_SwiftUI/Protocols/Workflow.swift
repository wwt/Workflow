//
//  Workflow.swift
//  SwiftCurrent
//
//  Created by Tyler Thompson on 12/24/22.
//  Copyright © 2022 WWT and Tyler Thompson. All rights reserved.
//  

import SwiftUI
import SwiftCurrent

@available(iOS 14.0, macOS 11, tvOS 14.0, watchOS 7.0, *)
public protocol Workflow: _WorkflowItemProtocol {
    associatedtype WI: _WorkflowItemProtocol
    associatedtype Wrapped: _WorkflowItemProtocol
    associatedtype PresentationBody: View
    @ViewBuilder func navigate(presentationType: LaunchStyle.SwiftUI.PresentationType, content: WI, nextView: Wrapped?, isActive: Binding<Bool>) -> PresentationBody
}

@available(iOS 14.0, macOS 11, tvOS 14.0, watchOS 7.0, *)
extension Workflow {
    @ViewBuilder public func navigate(presentationType: LaunchStyle.SwiftUI.PresentationType, content: WI, nextView: Wrapped?, isActive: Binding<Bool>) -> some View {
        switch presentationType {
            case .default:
                DefaultWorkflowPresenter().present(content: content, nextView: nextView, isActive: isActive)
            case .navigationLink:
                NavigationWorkflowPresenter().present(content: content, nextView: nextView, isActive: isActive)
            default: nil as Never?
        }
    }
}
